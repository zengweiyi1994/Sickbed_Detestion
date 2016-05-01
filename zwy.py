import numpy as np
import cv2
from matplotlib import pyplot as plt
def get_train_samples(self):
    samples = []
    for file_path in glob("/Users/zengweiyi/Desktop/train/*"):
        img_train = cv2.imread(file_path);
        samples.append(img_train)
    return samples

def train(self, samples):
    hist = np.zeros((256, 256, 256), dtype=np.float)
    for img in samples:
        tmp = 1.0 / img.size
        for i in xrange(img.shape[0]):
            for j in xrange(img.shape[1]):
                c1 = img[i,j,1]
                c2 = img[i,j,2]
                c3 = img[i,j,3]
                hist[c1, c2, c3] += tmp
    return hist / len(samples)

def pro(imgpath, threshold):
    I = cv2.imread(imgpath);
    samples = self.get_train_samples()
    hist = self.train(samples);
    count = 0
    for i in xrange(I.shape[0]):
            for j in xrange(I.shape[1]):
                c1 = img[i,j,1]
                c2 = img[i,j,2]
                c3 = img[i,j,3]
                if hist[c1,c2,c3] > threshold:
                    count = count + 1
    return count/((I.shape[0])*(I.shape[1])*3)
