GET _search
{
  "query": {
    "match_all": {}
  }
}

# GET _API/parameter

GET _cat/indices
GET _cluster/health
GET _nodes/stats

# Performing CRUD operations

# PUT Name-of-the-Index # creating an index
PUT favourite_candy 

# When indexing a document, both HTTP verbs POST or PUT can be used.
# Use POST when you want Elasticsearch to autogenerate an id for your document.
# POST Name-of-the-Index/_doc
# {
#   "field": "value"
# }
POST favourite_candy/_doc
{
  "first_name": "Lisa",
  "candy": "Sour Skittles"
}

# Use PUT when you want to assign a specific id to your document
PUT favourite_candy/_doc/1 
{
  "first_name": "Sally",
  "candy": "Snickers"
}

# If you want to update fields in a document, use the following syntax:
# POST Name-of-the-Index/_update/id-of-the-document-you-want-to-update
# {
#   "doc": {
#     "field1": "value",
#     "field2": "value",
#   }
# } 
POST favourite_candy/_update/1
{
  "doc":{
    "candy": "M&M'S"
  }
}

# If you do not want a existing document to be overwritten, you can use the _create endpoint!
# PUT Name-of-the-Index/_create/id-you-want-to-assign-to-this-document
# {
#   "field": "value"
# }
PUT favourite_candy/_create/1
{
  "first_name": "Finn",
  "candy": "Jolly Ranchers"
}


# Read a document
# GET Name-of-the-Index/_doc/id-of-the-document-you-want-to-retrieve
GET favourite_candy/_doc/1

PUT favourite_candy/_doc/2
{
  "first_name": "Rachel",
  "candy": "Rolos"
}
PUT favourite_candy/_doc/3
{
  "first_name": "Tom",
  "candy": "Sweet Tarts"
}

# Delete a document
# DELETE Name-of-the-Index/_doc/id-of-the-document-you-want-to-delete
DELETE favourite_candy/_doc/1
