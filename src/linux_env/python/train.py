import mrelbp
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression
from sklearn.naive_bayes import MultinomialNB
import time
import cv2
import math
import os 
import numpy as np

IMAGE_WIDTH = 128
IMAGE_HEIGHT = 128

def chiSquared(p, q):
    return np.sum((p - q) ** 2 / (p + q + 1e-6))

def make_train(root_path, rname, file_out, log_file):
    total_time = 0
    count = 0
    decision_path = os.path.join(root_path, "000")
    image_path = os.path.join(root_path, "images")
    
    with open(decision_path + "/classes.txt", "r") as file:
        numClasses = int(file.readline())
        classes = {}
        for line in file:
            columns = line.split()
            classes[int(columns[1])] = columns[0]

    print("Training steps:")
    with open(log_file, "w") as f:
    	f.write("")
    with open(decision_path + "/test.txt", "r") as train, open(log_file, "a") as f:
        numTrain = int(train.readline())
        mrelbp_hist_800 = []
        labels = []
        i = 0
        for current_line_number, line in enumerate(train):
            i += 1        
            labels.append(line.split()[1])
            file_name = line.split()[0]

            path_file = f'{image_path}/{file_name}'
            print(path_file)
            img = cv2.imread(path_file.rstrip(), cv2.IMREAD_GRAYSCALE)
            img_gray = cv2.resize(img, (IMAGE_HEIGHT, IMAGE_WIDTH), interpolation=cv2.INTER_LANCZOS4)
            start_time = time.time()
            combined_hist_800 = mrelbp.run(img_gray)
            end_time = time.time()
            execution_time = end_time - start_time
            print(f"Execution Time: {execution_time:.4f} seconds")
            f.write(f"{path_file} - Execution Time: {execution_time:.4f} seconds\n")
            total_time += execution_time
            count += 1
            mrelbp_hist_800.append(combined_hist_800)
            print(i)
            if i >= numTrain:
                np.save(f'{root_path}/{rname}_data.npy', np.array(mrelbp_hist_800))
                np.save(f'{root_path}/{rname}_label.npy', np.array(labels))
                break

    SVM_classifier_mrelbp = make_pipeline(StandardScaler(), SVC(gamma='auto'))
    SVM_classifier_mrelbp.fit(mrelbp_hist_800, labels)

    result_labels_and_hist_800 = []
    print("testing steps:")
    with open(decision_path + "/train.txt", "r") as train, open(log_file, "a") as f:
        print(train.readline())
        test_hist_800 = []
        test_labels = []
        i = 0  
        for current_line_number, line in enumerate(train):
            i += 1        
            test_labels.append(line.split()[1])
            file_name = line.split()[0]

            path_file = f'{image_path}/{file_name}'
            print(path_file)
            img = cv2.imread(path_file.rstrip(), cv2.IMREAD_GRAYSCALE)
            img_gray = cv2.resize(img, (IMAGE_HEIGHT, IMAGE_WIDTH), interpolation=cv2.INTER_LANCZOS4)
            start_time = time.time()
            combined_hist_800 = mrelbp.run(img_gray)
            end_time = time.time()
            execution_time = end_time - start_time
            print(f"Execution Time: {execution_time:.4f} seconds")
            f.write(f"{path_file} - Execution Time: {execution_time:.4f} seconds\n")
            total_time += execution_time
            count += 1
            test_hist_800.append(combined_hist_800)
            result_labels_and_hist_800.append((line.split()[1], combined_hist_800))
            print(i)
            if i >= 480:
                np.save(f'{root_path}/{rname}_test.npy', np.array(result_labels_and_hist_800, dtype=object))
                break

    result_SVM_labels_mrelbp_hist = []
    for m in range(480):
        result_SVM_labels_mrelbp_hist.append((
            result_labels_and_hist_800[m][0],
            SVM_classifier_mrelbp.predict([result_labels_and_hist_800[m][1]])
        ))

    pred = sum(int(a[0] == a[1][0]) for a in result_SVM_labels_mrelbp_hist)
    print('predictions =', pred)
    print('accuracy svm =', pred / 480 * 100)

    with open(file_out, "w") as file:
        file.write(f'accuracy svm = {pred / 480 * 100}\n')

    NB_classifier_mrelbp = MultinomialNB()
    LR_classifier_mrelbp = LogisticRegression(random_state=0)
    KNN_classifier_mrelbp = KNeighborsClassifier(n_neighbors=3, weights='uniform', algorithm='auto', metric=chiSquared)

    result_NB_labels_mrelbp_hist = []
    result_LR_labels_mrelbp_hist = []
    result_KNN_labels_mrelbp_hist = []

    NB_classifier_mrelbp.fit(mrelbp_hist_800, labels)
    LR_classifier_mrelbp.fit(mrelbp_hist_800, labels)
    KNN_classifier_mrelbp.fit(mrelbp_hist_800, labels)

    for m in range(480):
        result_NB_labels_mrelbp_hist.append((
            result_labels_and_hist_800[m][0],
            NB_classifier_mrelbp.predict([result_labels_and_hist_800[m][1]])
        ))
        result_LR_labels_mrelbp_hist.append((
            result_labels_and_hist_800[m][0],
            LR_classifier_mrelbp.predict([result_labels_and_hist_800[m][1]])
        ))
        result_KNN_labels_mrelbp_hist.append((
            result_labels_and_hist_800[m][0],
            KNN_classifier_mrelbp.predict([result_labels_and_hist_800[m][1]])
        ))

    # NB accuracy
    pred = sum(int(a[0] == a[1][0]) for a in result_NB_labels_mrelbp_hist)
    print('predictions =', pred)
    print('accuracy nb =', pred / 480 * 100)
    with open(file_out, "a") as file:
        file.write(f'accuracy nb = {pred / 480 * 100}\n')

    # LR accuracy
    pred = sum(int(a[0] == a[1][0]) for a in result_LR_labels_mrelbp_hist)
    print('predictions =', pred)
    print('accuracy lr =', pred / 480 * 100)
    with open(file_out, "a") as file:
        file.write(f'accuracy lr = {pred / 480 * 100}\n')

    # KNN accuracy
    pred = sum(int(a[0] == a[1][0]) for a in result_KNN_labels_mrelbp_hist)
    print('predictions =', pred)
    print('accuracy knn =', pred / 480 * 100)
    with open(file_out, "a") as file:
        file.write(f'accuracy knn = {pred / 480 * 100}\n')

    with open(file_out, "a") as file:
        file.write(f'Total time: {total_time:.4f} seconds\n')
        file.write(f'Average time per image: {total_time / count:.4f} seconds\n')

# Gọi hàm train
dataset_dir = "dataset"
# print(dataset_dir)
folder_names = []
for folder_name in os.listdir(dataset_dir):
    folder_path = os.path.join(dataset_dir, folder_name)
    if os.path.isdir(folder_path):
        folder_names.append(folder_name)


for i in range(0, len(folder_names)):
    print(folder_names[i])
    outex_11r = os.path.join(dataset_dir, folder_names[i])
    make_train(outex_11r, f"{folder_names[i]}_r6", f"report/r6/{folder_names[i]}_r6.txt", f"report/r6/{folder_names[i]}_r6_log.txt")

