#!/usr/bin/env -S jq -Mf 
["Organization", "Status", "Download_Mbps", "Upload_Gbps", "Error_Display", "Potential_Fix"] ,
(.output[] | [
  (.extension[0].extension[] | select(.url=="organization-identifier").valueIdentifier.value // ""),
  (.valueCoding.code // ""),
  (.extension[0].extension[] | select(.url=="download-speed-from-remote").valueQuantity.value // ""),
  (.extension[0].extension[] | select(.url=="upload-speed-to-remote").valueQuantity.value // ""),
  (.. | select(.url? == "error").valueCoding.display // ""),
  (.. | select(.url? == "potential-fix").valueUrl // "")
]) | @csv
