require('excel.string')

local excel =
{
	read = require('excel.parser'),
	echo = require('excel.echo'),
	process = require('excel.filter'),
	save = require('excel.serialize'),
}
return excel
