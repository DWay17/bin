#!/usr/bin/env -S jq -Mrf
# json jq
# ID	Active	Identifier	Name	Endpoint	Last Updated

# example:
# {
#   "entry": [
#     {
#       "fullUrl": "https://dsf-fhir-ext.medicsh.de/fhir/Organization/2d19b9bb-767e-424f-afd1-e365aef518c7",
#       "resource": {
#         "resourceType": "Organization",
#         "id": "2d19b9bb-767e-424f-afd1-e365aef518c7",
#         "identifier": [
#           {
#             "system": "http://dsf.dev/sid/organization-identifier",
#             "value": "medizininformatik-initiative.de"
#           }
#         ],
#         "meta": {
#           "versionId": "22",
#           "lastUpdated": "2026-04-02T14:36:50.891+02:00",
#           "profile": [
#             "http://dsf.dev/fhir/StructureDefinition/organization"
#           ],
#           "tag": [
#             {
#               "system": "http://dsf.dev/fhir/CodeSystem/read-access-tag",
#               "code": "ALL"
#             }
#           ]
#         },
#         "extension": [
#           {
#             "url": "http://dsf.dev/fhir/StructureDefinition/extension-certificate-thumbprint",
#             "valueString": "bda2c140b96ddac4c1925bb237bf9fa728e295925ff8ebab1c454dfedc19c942d2d33847519fdf3b55f515215c029afc61e729ac59462d2932dd72c898619742"
#           }
#         ],
#         "identifier": [
#           {
#             "system": "http://dsf.dev/sid/organization-identifier",
#             "value": "uniklinikum-leipzig.de"
#           }
#         ],
#         "active": true,
#         "name": "Universitätsklinikum Leipzig",
#         "telecom": [
#           {
#             "system": "email",
#             "value": "presse@uniklinik-leipzig.de"
#           }
#         ],
#         "endpoint": [
#           {
#             "reference": "Endpoint/3a3c4a82-5190-48aa-8fca-10794413ed63",
#             "type": "Endpoint"
#           },
#           {
#             "reference": "Endpoint/12345678-5190-48aa-8fca-10794413ed63",
#             "type": "Endpoint"
#           }
#         ]
#       },
#       "search": {
#         "mode": "match"
#       }
#     }
#   ]
# }


["ID", "Active", "Identifier", "Name", "Endpoint", "Last Updated"],

(.entry[] as $item |
  ($item.resource.id // "") as $id
  | ($item.resource.active // "") as $active
  | ($item.resource.identifier[]? | select(.system == "http://dsf.dev/sid/organization-identifier").value // "") as $identifier
  | ($item.resource.name // "") as $name
  | ($item.resource.endpoint[]? | .reference // "" | split("/")[1]) as $endpoint
  | ($item.resource.meta.lastUpdated // "") as $lastUpdated
  #
  | [$id, $active, $identifier, $name, $endpoint, $lastUpdated]
)

| @tsv
