#!/bin/env groovy

def x = new Date() 

switch(x) {
	case "Groovy" : println "in x steht der String Groovy"
		break
	case Date : println "x ist ein Datum"
		break
	case 1..10 : println "x ist Zahl zwischen 1 und 10"
		break
	default : println "x ist etwas anderes"
}
switch (this.args) {
	case String: println "args is a String"
		break
	default:
		println "some other: args is a " + this.args.class.simpleName
}
args.each {
	switch (it) {
	default:
		println "some other: it is a " + it.class.simpleName
	}
}
args.each {
	def valueOfIt = it.valueOf()
	switch (valueOfIt) {
	default:
		println "some other: valueOfIt is a " + valueOfIt.class.simpleName
	}
}
