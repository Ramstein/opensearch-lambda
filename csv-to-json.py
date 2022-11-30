import csv
import os

from confs import user, password, domain_url

data_path = r""


def make_json(csvFilePath, jsonFilePath):
    # create a dictionary
    data = open(jsonFilePath, "w")

    index = "marvel_movies"
    api_op = "_bulk"
    path_to_file = "bulk.json"

    curl_cmd = f"curl - XPOST - u {user}:{password} {domain_url}/{index}/{api_op} --data-binary @{path_to_file} - H 'Content-Type: application/json'"

    for root, dirs, files in os.walk(data_path, topdown=True):
        print(root, dirs, files)

    # with open(csvFilePath, encoding='utf-8') as csvf:
    #     csvReader = csv.DictReader(csvf)
    #
    #     # Convert each row into a dictionary
    #     # and add it to data
    #     for i, rows in enumerate(csvReader):
    #         index_val = {"index": {"_id": i + 1}}
    #         data.write(str(index_val) + "\n")
    #         data.write(str(rows) + "\n")
    #
    #         # key = rows['HH_ID']
    #         # data["index"] = {"_id": i + 1}
    #         # data[key] = rows
    # data.close()


# Driver Code

# Decide the two file paths according to your
# computer system
csvFilePath = r'C:\Users\ZEESHAN ALAM\Documents\SC\250807711\dataset_sample.csv'
jsonFilePath = r'dataset_sample.json'

# Call the make_json function
make_json(csvFilePath, jsonFilePath)
