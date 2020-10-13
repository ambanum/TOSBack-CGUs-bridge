import fsApi from 'fs';
const fs = fsApi.promises;

let reportedDone = [];
let foundResult = [];

async function run() {
  const processingFileText = await fs.readfile('processing.txt');
  reportedDone = processingFileText.toString().split('\n').filter(line => line.indexOf(' done') !== -1);
  console.log(reportedDone);
  return;
  const files = await fs.readdir('../CGUs/services/');
  const promises = files.forEach(async(fileName) => {
    const text = await fs.readFile(`../CGUs/services/${fileName}`);
    const obj = JSON.parse(text);
    Object.keys(obj.documents).forEach(docName => {
      console.log([ obj.name, docName ]);
    });
  });
  await Promise.all(promises);
}

// ...
run();