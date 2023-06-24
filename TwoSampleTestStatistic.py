import numpy as np
from scipy.stats import ttest_ind

# Data
fish_oil = np.array([8, 12, 9, 14, 2, 0, 0, 7])
standard_oil = np.array([-6, 0, 1, 2, -3, -4, 2])

# Calculate the test statistic
test_statistic, _ = ttest_ind(fish_oil, standard_oil, alternative='greater')

print("Test Statistic:", test_statistic)
