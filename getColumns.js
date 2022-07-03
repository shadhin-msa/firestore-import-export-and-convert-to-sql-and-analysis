
const fs = require('fs');

// read data
const fileName = 'kolpoTasks'

const filePath = './kolpoOrg2022/'
const outputPath = filePath + 'columns/'

const rawdata = fs.readFileSync(filePath + fileName + '.json');
const dataJsonObj = JSON.parse(rawdata);

// get columns
const formatedData = getColumnsFromObj(dataJsonObj)


// create directory if not exist
if (!fs.existsSync(outputPath)){
  fs.mkdirSync(outputPath);
}

// Write collection to JSON file
fs.appendFile(outputPath + fileName + '_columns.json', '', function(err) {
  if(err) {
      return console.log(err);
  }
  console.log("sql file created");
})

fs.writeFile( outputPath + fileName + '_columns.json', JSON.stringify(formatedData), function(err) {
  if(err) {
      return console.log(err);
  }
  console.log("The file was saved!");
});

// function to get Columns from obj
function getColumnsFromObj (data) {
  let colObj = {}
  Object.keys(data).forEach(key => {

    let dataSet = data[key]
    // does columns has all keys. if not then add
    Object.keys(dataSet).forEach(DSKey => {
      if (!(DSKey in colObj) ) {
       colObj[DSKey] = "'"
      }
    })
  })
  return colObj
  // array.join("").toString()
}

