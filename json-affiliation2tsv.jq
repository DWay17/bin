#!/usr/bin/env -S jq -Mrf
# json jq
#ID	Active	Parent Organization	Participating Organization	Role	Endpoint	Last Updated
# example:
# {
#   "resourceType": "Bundle",
#   "type": "searchset",
#   "timestamp": "2026-04-16T11:59:13.363+02:00",
#   "total": 17,
#   "link": [
#     {
#       "relation": "self",
#       "url": "https://dsf-fhir-ext.medicsh.de/fhir/OrganizationAffiliation?_pretty=true&_page=1&_count=20&active=true&_format=json&_sort=-_lastUpdated"
#     },
#     {
#       "relation": "first",
#       "url": "https://dsf-fhir-ext.medicsh.de/fhir/OrganizationAffiliation?_pretty=true&_page=1&_count=20&active=true&_format=json&_sort=-_lastUpdated"
#     },
#     {
#       "relation": "last",
#       "url": "https://dsf-fhir-ext.medicsh.de/fhir/OrganizationAffiliation?_pretty=true&_page=1&_count=20&active=true&_format=json&_sort=-_lastUpdated"
#     }
#   ],
#   "entry": [
#     {
#       "fullUrl": "https://dsf-fhir-ext.medicsh.de/fhir/OrganizationAffiliation/dcb22faa-fc00-4a0f-bc6e-76a71d5cfdc8",
#       "resource": {
#         "resourceType": "OrganizationAffiliation",
#         "id": "dcb22faa-fc00-4a0f-bc6e-76a71d5cfdc8",
#         "meta": {
#           "versionId": "22",
#           "lastUpdated": "2026-04-02T14:36:45.135+02:00",
#           "profile": [
#             "http://dsf.dev/fhir/StructureDefinition/organization-affiliation"
#           ],
#           "tag": [
#             {
#               "system": "http://dsf.dev/fhir/CodeSystem/read-access-tag",
#               "code": "ALL"
#             }
#           ]
#         },
#         "active": true,
#         "organization": {
#           "reference": "Organization/1bbd4fa0-7f46-4313-9e0a-3e0b31ab0510",
#           "type": "Organization"
#         },
#         "participatingOrganization": {
#           "reference": "Organization/6642bfd9-0f32-467c-82a6-a973f5a42e2f",
#           "type": "Organization"
#         },
#         "code": [
#           {
#             "coding": [
#               {
#                 "system": "http://dsf.dev/fhir/CodeSystem/organization-role",
#                 "code": "DIC"
#               }
#             ]
#           }
#         ],
#         "endpoint": [
#           {
#             "reference": "Endpoint/0375523e-b14b-4d1c-afb3-df194dc845f2",
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

["ID", "Active", "Parent Organization", "Participating Organization", "Role", "Endpoint", "Last Updated"],

(.entry[] as $item |
  ($item.resource.id // "") as $id
  | ($item.resource.active // "") as $active
  | ($item.resource.organization.reference // "" | split("/")[1]) as $parentOrganization
  | ($item.resource.participatingOrganization.reference // "" | split("/")[1]) as $participatingOrganization
  | ($item.resource.code[]? | .coding[]? | select(.system == "http://dsf.dev/fhir/CodeSystem/organization-role").code // "") as $role
  | ($item.resource.endpoint[]? | .reference // "" | split("/")[1]) as $endpoint
  | ($item.resource.meta.lastUpdated // "") as $lastUpdated
  | [$id, $active, $parentOrganization, $participatingOrganization, $role, $endpoint, $lastUpdated]
)

| @tsv

