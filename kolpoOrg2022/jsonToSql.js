
const fs = require('fs');

// read data
const fileName = 'kolpoTasks'

const filePath = './kolpoOrg2022/'
const outputPath = filePath + 'sql/'

const rawdata = fs.readFileSync(filePath + fileName + '.json');
const dataJsonObj = JSON.parse(rawdata);

// first run node getColumns.js
// get columns
const rawColData = fs.readFileSync(filePath+ 'columns/' + fileName + '_columns.json')
const columns = JSON.parse(rawColData);



// update the data
// const formatedData = columns
const formatedData = formatToSql(dataJsonObj, columns)

// create directory if not exist
if (!fs.existsSync(outputPath)){
  fs.mkdirSync(outputPath);
}

// Write collection to JSON file
fs.appendFile(outputPath + fileName + '.sql', '', function(err) {
  if(err) {
      return console.log(err);
  }
  console.log("sql file created");
})

fs.writeFile( outputPath + fileName + '.sql', formatedData, function(err) {
  if(err) {
      return console.log(err);
  }
  console.log("The file was saved!");
});



// function to format into sql values

function formatToSql (payload, columns) {
  let sql = ''
  console.log('format to sql function started')

  let columns_keys = Object.keys(columns)

  Object.keys(payload).forEach(key => {
    sql += ", \r\n('" + key + "'"
    let dataSet = payload[key]
    // console.log('dataSet')
    // console.log(dataSet)

    columns_keys.forEach( k => {
      sql += ", " + (( typeof dataSet[k] !== 'undefined')? columns[k] + dataSet[k] + columns[k] : null)
    });
    sql += ")"

  });

  let headingRow = "( fid"
  columns_keys.forEach( col_name => {
    headingRow += ", " + col_name + ""
  });

  headingRow += ") VALUES \r\n"
  return headingRow + sql + ";"

}