## **Table of contents**

1. [Task 1 - Image compression using SVD](#task-1---image-compression-using-svd)
2. [Task 2 and Task 3 - Image compression using principal component analysis](#task-2-and-task-3---image-compression-using-principal-component-analysis)
3. [Task 4 - Recognizing handwritten digits](#task-4---recognizing-handwritten-digits)

## **Task 1 - Image compression using SVD**

1. Initialize the final matrix
2. Cast the photo variable to `double`
3. Apply the SVD algorithm for `photo`
4. Calculate the reduced matrices `U` , `S` and `V`
5. Store the transposed `V` in `V_t`
6. Compute `new_X`
7. Cast the array `new_X` to `"uint8"`

## **Task 2 and Task 3 - Image compression using principal component analysis**

### "task2" function:

1. Initialize the final matrix
2. Cast the photo variable to `double`
3. In `Miu` calculate the average of each line
4. Normalize the initial matrix
5. Construct the matrix `Z` according to the formula
6. Calculate the matrices `U`, `S` and `V` in SVD for `Z` matrix
7. Construct the `W` matrix
8. Calculate the `Y` matrix
9. Approximate the initial matrix
10. Cast the `new_W` matrix to `uint8`

### "task3" function:

1. Initialize the final matrix
2. Cast the photo variable to `double`
3. In `Miu` calculate the average of each row of the `photo` matrix
4. Normalize the initial matrix
5. Calculate the covariance matrix
6. Calculate the vectors and eigenvalues of the covariance matrix
7. Order the eigenvalues descendingly and create the matrix `V`
8. In `W` keep only the first `pcs` columns of the matrix `V`
9. Create matrix `Y` by changing the base of the initial matrix
10. Calculate the matrix `new_X` and add to it the average of the rows (`Miu`)
11. Cast the `new_W` matrix to `uint8`

## **Task 4 - Recognizing handwritten digits**

### "visualise_image" function:

1. Initialize the final matrix
2. Transform the read line into a 28x28 matrix which is then transposed
3. Cast the matrix `im` to `uint8`

### "prepare_data" function:

1. Initialize `train_mat` and `train_val`
2. Load the data from the table received as parameter (using the `load` function)
3. Store the first `no_train_images` lines of the training image table in the `train_mat` array
4. The first `no_train_images` label vector values are stored in the `train_val`

### "prepare_photo" function:

1. Initialize the final string
2. Invert the `im` image pixels
3. Transpose the `im` image
4. `im` image is transformed into a vector

### "magic_with_pca" function:
1. Initialize `train`, `miu`, `Y`, `Vk`
2. Cast the `train_mat` array to `double`
3. Calculate the average of each column of the matrix and subtract it from the initial matrix
4. Calculate the vectors and eigenvalues of the covariance matrix in `U`, `S` and `V`
5. Order the eigenvalues descendingly and create the matrix `V`
6. Keep only the first pcs columns of the previously obtained matrix
7. Create the `Y` matrix by changing the base of the initial matrix
8. Calculate the `train` matrix
9. Cast the `train` matrix to `"uint8"`

### "KNN" function:
1. Initialize `prediction`, `n`, `m `and `distance`
2. Cast the `train_mat` to `double`
3. For each row calculate the Euclidean distance between it and the test vector received as argument
4. Order the distances in ascending order
5. Store in `k_values` the first `k` elements of the `"labels"` vector that correspond to the first 5 indexes in the `distance` vector
6. Compute the prediction as the median of the `k` closest values (in `prediction`)

### "classify_image" function:
1. Initialize `prediction`
2. Apply the `magic_with_pca` function to the training dataset
3. Subtract the average of each column in the `train_mat` from the image vector
4. Change the base by multiplying `im` by the matrix `Vk`
5. Compute the prediction using the `KNN` function.
