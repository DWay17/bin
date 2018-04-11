// https://www.heise.de/developer/artikel/Webframeworks-fuer-JVM-Sprachen-Rails-gegen-Grails-2586352.html?seite=all
(1..1000).sum() // Summe aus Range
[49, 58, 82, 90].split { it > 60 } // Gruppieren
assert ['PHP', 'Java']*.size() == [3, 4] // Spread Operator
assert campaign.name ?: "Default" == campaign.name ? campaign.name :
 "Default"
println(campaign?.product?.name) // Safe Navigation

// GORM Composition
class Address {
    String number
    String code
}
class Person {
    Address homeAddress
    Address workAddress
    static embedded = ['homeAddress', 'workAddress']
}

// GORM Inheritance (mittels Typ-Spalte oder in einer weiteren Tabelle)
class Content {
    String author
}
class BlogEntry extends Content {
    URL url
}

class SimpleTagLib {
    /**
     * @attr bye Begrüßung ('true') oder Verabschiedung ('false')
     */
    def helloOrGoodbye = { attrs, body ->
        out << (attrs.bye == 'true' ? "Tschüss " : "Hallo ") << body()
    }
}
// in der GSP Datei, Ausgabe: "Tschüss Jochen" 
<g:helloOrGoodbye bye="true">Jochen</g:helloOrGoodbye>


def "Länge der Strings"() {
    expect:
      name.size() == length

    where:
      name     | length
      "PHP"    | 3
      "Java"   | 4
      "Groovy" | 6
}

// convert
Short s = new Integer(6) as Short
List collection = new HashSet().asType(List)

new File('/path/to/file').eachLine('UTF-8') {
   println it
}
// or, if you want a version closer to Java:

new File('/path/to/file').withReader('UTF-8') { reader ->
   reader.eachLine {
       println it
   }
}

assert 'c'.getClass()==String
assert "c".getClass()==String
assert "c${1}".getClass() in GString

{
	int i = 3

	def s1 = "i's value is: ${i}"
	def s2 = "i's value is: ${-> i}"
	
	i++
	
	assert s1 == "i's value is: 3" // eagerly evaluated, takes the value on creation
	assert s2 == "i's value is: 4" // lazily evaluated, takes the new value into account
}

{
	// java
	throw new PluginException("Failed to execute command list-applications:" +
	" The group with name " +
	parameterMap.groupname[0] +
	" is not compatible group of type " +
	SERVER_TYPE_NAME)
	
	// You can use the \ continuation character (this is not a multiline string):
	throw new PluginException("Failed to execute command list-applications: \
	The group with name ${parameterMap.groupname[0]} \
	is not compatible group of type ${SERVER_TYPE_NAME}")
	
	//	Or using multiline strings with triple quotes:
	throw new PluginException("""Failed to execute command list-applications:
	The group with name ${parameterMap.groupname[0]}
	is not compatible group of type ${SERVER_TYPE_NAME)}""")
}
