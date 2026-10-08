# misc.jq
exit 

Da jede Organisation in einem eigenen output-Element steckt, kannst du diese so auflisten:

Bash
jq -r '.output[] | {
  org: (.extension[0].extension[] | select(.url=="organization-identifier").valueIdentifier.value),
  status: .valueCoding.code
}'

Die Fehlermeldungen liegen sehr tief (output -> extension -> extension -> extension -> extension). Dieser Befehl fischt sie heraus:

Bash
jq -r '.output[].extension[].extension[] 
  | select(.url == "errors").extension[].extension[] 
  | select(.url == "error").valueCoding.display'
  
Falls du eine Tabelle der gemessenen Geschwindigkeiten pro Organisation erstellen möchtest:

# Bash
jq -r '.output[] | 
  select(.extension[0].extension[].url == "download-speed-from-remote") | 
  [
    (.extension[0].extension[] | select(.url=="organization-identifier").valueIdentifier.value),
    (.extension[0].extension[] | select(.url=="download-speed-from-remote").valueQuantity.value),
    (.extension[0].extension[] | select(.url=="upload-speed-to-remote").valueQuantity.value)
  ] | @tsv'
  
  
# Hier ist der jq-Befehl, der eine CSV-Header-Zeile definiert und die Felder entsprechend zuordnet:

# Bash
jq -r '["Organization", "Status", "Download_Mbps", "Upload_Gbps", "Error_Display", "Potential_Fix"] ,
(.output[] | [
  (.extension[0].extension[] | select(.url=="organization-identifier").valueIdentifier.value // ""),
  (.valueCoding.code // ""),
  (.extension[0].extension[] | select(.url=="download-speed-from-remote").valueQuantity.value // ""),
  (.extension[0].extension[] | select(.url=="upload-speed-to-remote").valueQuantity.value // ""),
  (.. | select(.url? == "error").valueCoding.display // ""),
  (.. | select(.url? == "potential-fix").valueUrl // "")
]) | @csv'

jq '[ paths as $p | select(getpath($p) | strings | contains("UKSH")) | $p ]' fhir_file.json
jq -r 'paths as $p | select(getpath($p) | strings | contains("uksh")) | ["" , $p[]] | join(".")' ../../20260904_1355_83ad5e36-2fc0-42eb-99b5-d4160116f8f3/dimp/dimped_47c39373-68f4-4739-b4d4-20fc041b22ef.34.json | sed -Ee 's#entry\.[0-9]+\.#etry.0.#g' | uniq2

jq -r 'paths as $p | select(getpath($p) | strings | ascii_downcase | contains("uksh")) | ["" , $p[]] | join(".")' fhir_file.json

