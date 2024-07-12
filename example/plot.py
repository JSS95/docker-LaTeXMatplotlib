import argparse
import matplotlib.pyplot as plt

parser = argparse.ArgumentParser()
parser.add_argument("-o", "--out", type=str, help="Output image file")
args = parser.parse_args()

plt.rcParams["figure.figsize"] = (6, 3)
plt.rcParams["figure.autolayout"] = True
plt.rcParams["text.usetex"] = True
plt.rcParams["font.family"] = "serif"
plt.rcParams["font.serif"] = "Computer Modern Roman"
plt.rcParams["font.size"] = 14

plt.plot([0, 1, 2], [0, 1, 2])
plt.xlabel("$x$")
plt.ylabel("$y$")
plt.savefig(args.out)
plt.close()
