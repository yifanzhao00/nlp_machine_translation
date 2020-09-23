import csv

def create_tsv(file_de, file_en, file_name):
    de = []
    en = []
    with open(file_de, 'r') as file_one, open(file_en, 'r') as file_two:
        for line in file_one:
            de.append(line)
        for line in file_two:
            en.append(line)
    with open('./' + file_name + '.tsv', 'wt') as out_file:
        for i in range(len(de)):
            tsv_writer = csv.writer(out_file, delimiter='\t')
            tsv_writer.writerow([de[i].strip(), en[i].strip()])


if __name__ == "__main__":
    create_tsv('./train.de', './train.de', 'train')
    create_tsv('./dev.de', './dev.en', 'dev')
