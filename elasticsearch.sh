GET _search
{
  "query": {
    "match_all": {}
  }
}

# GET _API/parameter

GET _cat/indices?v
GET _cluster/health
GET _nodes/stats

# Performing CRUD operations

# PUT Name-of-the-Index # creating an index
PUT favourite_candy 
PUT infraocw_binlog 

GET infraocw_binlog/


# OR create index on some specific schema
PUT candy01
{
  "settings": {
    "index": {
      "number_of_replicas": 2,
      "number_of_shards": 3
    }
  },
  "mappings": {
    "properties": {
      "first_name": {
        "type": "text"
      }
    }
  }
}

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
    "candy": ["M&M'S", "Start"]
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

# Bulk Insert
PUT _bulk/
{"index": {"_index": "favourite_candy", "_id": "4"}}
{"first_name": "Rahul", "fav_candy": ["coconut", "mango"], "count":10}
{"index": {"_index": "favourite_candy", "_id": "5"}}
{"first_name": "Sahil", "fav_candy": ["coconut", "mango"], "count":10}
{"index": {"_index": "favourite_candy", "_id": "5"}}
{"first_name": "Ankit", "fav_candy": ["coconut", "mango"], "count":10}


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

# deleting complete index
DELETE candy01

# Search API
# basic search = term search =  for exact matches
GET favourite_candy/_search
{
  "query": {
    "term": {
      "first_name.keyword": {
        "value": "Ankit"
      }
    }
  }
}

# analytical search =  match search
GET favourite_candy/_search
{
  "query": {
    "match": {
      "first_name": "ankit"
    }
  }
}


# let's get into our own data
GET marvel_movies

GET marvel_movies/_doc/1

GET marvel_movies/_search
{
  "query": {
    "term": {
      "Title.keyword": {
        "value": "Captain America: The First Avenger (2011) - IMDb"
      }
    }
  }
}

# search across a field
GET marvel_movies/_search
{
  "query":{
    "match": {
      "Title": "iron man"
    }
  }
}

# match the whole phrase like complete "iron man"
GET marvel_movies/_search
{
  "query": {
    "match_phrase": {
      "Title": "iron man"
    }
  }
}

# search across multiple fields like title, plot, cast
GET marvel_movies/_search
{
  "size": 20,
  "query": {
    "multi_match": {
      "query": "iron man",
      "fields": ["Title^4", "Plot^2"]
    }
  }
}

# fuzziness = 1 (one character error i would give also in result)
GET marvel_movies/_search
{
  "size": 20,
  "query": {
    "multi_match": {
      "query": "Avenger",
      "fields": ["Title"],
      "fuzziness": 0
    }
  }
}


GET bank_accounts/_doc/2



