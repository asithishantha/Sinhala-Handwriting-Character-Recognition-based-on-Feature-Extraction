# feature-extraction-technique-based-character-recognition-using-ann-for-Sinhala-Characters
 
This project describes a basic approach, taken for Sinhala handwritten character recognition based on feature extraction. The research was performed with the idea of identifying most efficient and accurate method, based on character geometry-based feature extraction technique for Sinhala handwritten character recognition. Data acquisition, digitalization, preprocessing, feature extraction was done using the digital image processing techniques. The classification was measured using an ANN based classifier on a common testing and training data sets. The classification performance was measured for 34 Sinhala characters using this research. Finally, recognized Sinhala handwritten character will be printed on a text document.


## Used technologies
- MatLab
- Image processing toolbox
- Neural Network toolbox
- pattern recognition

## How to run this application

- run the create_target_metrics.m, this will create the y matrics. one character have 25 different sampels.so 25 * 34 = 850 samples in the training_set folder.
 you can change this according to your program.
- run the myFeatureScript.m, this will extract the feature and store in the x matrics. 
- then you need to train the neural network using train.m.
- give the image path in image = imread('image path'); and run the extract_word_from_image.m

output will be printed to output.txt.

click this link to access project report.
https://www.researchgate.net/publication/349767482_Sinhala_Handwriting_Character_Recognition_based_on_Feature_Extraction
