import fsApi from 'fs';
const fs = fsApi.promises;

async function run () {
  const fileNames = (await fs.readFile('./crawl-files-list.txt')).toString().split('\n').filter(x => x.length);
  const reportLines = (await fs.readFile('./processing.txt')).toString().split('\n').filter(x => x.length);
  const collect = {};
  fileNames.forEach(fileName => {
  	collect[fileName] = {
		done: [],
		unknownType: [],
		unknownType2: [],
		duplicateType: [],
		noFileText: [],
		noFilteredContent: [],
		cannotRead: [],
		ruleWasDeleted: [],
		inconsistent: [],
		covered: [],
		tooShort: [],
		selectorNotFound: [],
		caseSensitivity: [],
		unclassified: []
	};
  });
  
  function getFileNameFromReportLine(reportLine) {
  	const parts = reportLine.split('.txt ');
  	if (parts.length === 2) {
  		return parts[0] + '.txt';
  	}
  }
  function getLineType(reportLine) {
  	const parts = reportLine.split('.txt ');
  	if (parts.length !== 2) { // should not happen
			return 'should not happen';
		}
	  if (parts[1].endsWith(' done')) {
		  return 'done';
	  }
	  if (parts[1].startsWith('Found 0 docname objects with name')) {
		  return 'ruleWasDeleted';
	  }
	  if (parts[1].startsWith('selector not found ')) {
		  return 'selectorNotFound';
	  }
	  if (parts[1].startsWith('bomb fatal: ambiguous argument ')) {
		  return 'caseSensitivity';
	  }
	  if (parts[1] === 'inconsistent') {
		  return 'inconsistent';
	  }
	  if (parts[1] === 'too short') {
		  return 'tooShort';
	  }
	  if (parts[1].endsWith(' Already covered')) {
		  return 'covered';
	  }
	  if (parts[1].startsWith('not fetchable ')) {
		  return 'cannotRead';
	  }
	  if (parts[1].endsWith('Same type used twice!')) {
		  return 'duplicateType';
	  }
	  if (parts[1].startsWith('no file text at tosback2-commit ')) {
		  return 'noFileText';
	  }
	  if (parts[1].startsWith('no filtered content from tosback2-commit ')) {
		  return 'noFilteredContent';
	  }
	  if (parts[1].startsWith('recording snapshot but not version')) {
		  return 'unknownType2';
	  }
	  if (parts[1].startsWith('not importing rule since versionDestPath is null')) {
		  return 'unknownType';
	  }
	  if (parts[1].indexOf('fail Cannot read property ') !== -1) {
		  return 'cannotRead';
	  }
	  console.log(parts[1]);
		return 'unclassified';
  }

  reportLines.forEach(reportLine => {
  	const fileName = getFileNameFromReportLine(reportLine);
		if (!collect[fileName]) {
		  return;
  	}
	  const lineType = getLineType(reportLine);
  	collect[fileName][lineType].push(reportLine);
	  if (collect['crawl' + fileName.substring('crawl_reviewed'.length)]) {
			collect['crawl' + fileName.substring('crawl_reviewed'.length)][lineType].push(reportLine);
	  }
  });
  Object.keys(collect).forEach((fileName) => {
    delete collect[fileName].unknownType2;
		let total = 0;
    Object.keys(collect[fileName]).forEach(type => {
		  // these types may occur multiple times in the logs:
	    if (collect[fileName][type].length > 1) {
		    if (type === 'noFilteredContent' || type === 'noFileText') {
			    collect[fileName][type] = [ collect[fileName][type][0] ];
		    }
	    }
	    if (collect[fileName][type].length > 1) {
		    console.log(collect[fileName]);
		    throw new Error('dupe!', fileName, type);
	    }
	    total += collect[fileName][type].length;
    });
	  if (total === 0) {
		  console.log(fileName, collect[fileName]);
		  throw new Error('inconclusive!', fileName);
	   }
		if (total > 1) {
			delete collect[fileName].noFileText;
			total = 0;
			Object.keys(collect[fileName]).forEach(type => {
				total += collect[fileName][type].length;
			});
		}
		if (total > 1) {
			delete collect[fileName].noFilteredContent;
			total = 0;
			Object.keys(collect[fileName]).forEach(type => {
				total += collect[fileName][type].length;
			});
		}
		if (total > 1) {
			delete collect[fileName].unknownType;
			total = 0;
			Object.keys(collect[fileName]).forEach(type => {
				total += collect[fileName][type].length;
			});
		}
		if (total > 1) {
			console.log(fileName, collect[fileName]);
			throw new Error('contradiction!', fileName);
		}
    Object.keys(collect[fileName]).forEach(type => {
	    if (collect[fileName][type].length === 1) {
		    console.log(fileName, type);
	    }
    });
  });
}

// ...
run();
