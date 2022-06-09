import re

# open tsv file and read as a text string
with open(r".\Data\ecs_3.tsv", 'r') as f:
    my_csv_text = f.read()

find_str = ':'
find_str_2 = '\|'
find_str_title = "# Gene Family"
find_str_column_name = "_Abundance-CPM"

replace_str = '\t'
replace_str_title = "Gene Family\tName+Organism"
replace_str_column_name = ""
#replace_str_title = "# Gene Family\tName\tOrganism"

# substitute
new_csv_str = re.sub(find_str, replace_str, my_csv_text)
print("Replace colon: Done")
#new_csv_str = re.sub(find_str_2, replace_str, new_csv_str)
#print("Replace vertical bar: Done")
new_csv_str = re.sub(find_str_title, replace_str_title, new_csv_str)
print("Replace title: Done")
new_csv_str = re.sub(find_str_column_name, replace_str_column_name, new_csv_str)
print("Replace column name: Done")

# open new file and save
new_csv_path = r".\Data\ecs_3_split.csv"
with open(new_csv_path, 'w') as f:
    f.write(new_csv_str)
print("Writing file: Done")