import numpy as np
from scipy.stats import ttest_ind

# Data
fish_oil = np.array([8, 12, 9, 14, 2, 0, 0, 7])
standard_oil = np.array([-6, 0, 1, 2, -3, -4, 2])

# Perform two-sample t-test
test_statistic, p_value = ttest_ind(fish_oil, standard_oil, alternative='greater')

print("P-value:", p_value)

if p_value < 0.05:
    print("The fish oil diet results in a greater reduction in blood pressure compared to the standard oil diet.")
else:
    print("There is no sufficient evidence to conclude that the fish oil diet results in a greater reduction in blood pressure compared to the standard oil diet.")
