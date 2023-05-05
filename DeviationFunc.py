import statistics as st

#declare the dataset list
dataset = [60, 77, 77, 78, 80, 80, 87, 87, 89, 91, 91]

#calculating standard deviation of the dataset
sd = st.stdev(dataset)

#display output
print("Standard Deviation of the dataset is", sd)