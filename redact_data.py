import csv


SENSITIVE_COLUMNS = [
    "FirstName",
    "Surname",
    "EmergencyContactPhone",
    "EmergencyContactName",
    "SalaryAccountNumber",
    "SalarySortCode",
    "UnionMembershipNumber"
]


def redact_data(data):
    return data


def read_csv(source):
    data = []
    with open(source, newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            data.append(row)
    return data, reader.fieldnames


def write_csv(data, fieldnames, destination):
    with open(destination, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(data)


if __name__ == "__main__":
    csv_name_list = ['Employee']
    for csv_name in csv_name_list:
        source = f"data/{csv_name}.csv"
        data, fieldnames = read_csv(source)
        data = redact_data()
        destination = f"data/{csv_name}_dev.csv"
        write_csv(data, fieldnames, destination)
