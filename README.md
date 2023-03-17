# SqueezeFacePoseNet: Lightweight Face Verification Across Different Poses for Mobile Platforms



This repository is the original implementation of the paper **[SqueezeFacePoseNet: Lightweight Face Verification Across Different Poses for Mobile Platforms](https://arxiv.org/abs/2007.08566)**, published at [ICPR 2020](https://www.micc.unifi.it/icpr2020/) (International Conference on Pattern Recognition) - [WMWB workshop](http://wmb2020.iapr-tc4.org/) (IAPR TC4 Workshop on Mobile and Wearable Biometrics.

**Please consider citing the paper if you use in your research the models shared here:**
Alonso-Fernandez, F., Barrachina, J., Hernandez-Diaz, K., Bigun, J. (2021). SqueezeFacePoseNet: Lightweight Face Verification Across Different Poses for Mobile Platforms. In: , et al. Pattern Recognition. ICPR International Workshops and Challenges. ICPR 2021. Lecture Notes in Computer Science(), vol 12668. Springer, Cham. https://doi.org/10.1007/978-3-030-68793-9_10

The model is an implementation of the SqueezeNet CNN (**a very lightweight architecture of just 4.41MB**) to carry out pose-invariant face recognition. It is trained on the MS-Celeb-1M and VGGFace2 databases (6.47M images in total). The training is done following the double fine-tuning implementation suggested in the paper [VGGFace2: A dataset for recognising faces across pose and age](https://arxiv.org/abs/1710.08092). 

To achieve an even smaller model (**2.5MB**), we have also replaced standard convolution with depth-wise separable convolution (DWC) in all 3×3 filters, at the cost of a slight worse accuracy.

---

![squeezefaceposenet_networks_evaluated](https://user-images.githubusercontent.com/6042693/106066359-fb5af780-60fc-11eb-84c4-395cb895f25e.png)

---

![squeezefaceposenet_evaluation_protocols](https://user-images.githubusercontent.com/6042693/106066493-30674a00-60fd-11eb-80da-7609b05595eb.png)

---

![squeezefaceposenet_verification_results_vgg](https://user-images.githubusercontent.com/6042693/106066145-a0290500-60fc-11eb-95e8-86af004dec78.png)

---

# Requirements
  - Matlab software (tested in r2019b and r2020b)

# Usage
  - See usage.m file

# Pre-processing
  - Input images must be of 113 x 113. We follow the tight crop of VGGFace2, with an extra 30% increase of the face bounding box, so some contextual information is added aound the face. See attached examples and the figures above to see how the input images should look like. 
  - The network is trained with images with some random displacement in horizontal and vertical dimensions, so it should be somehow tolerant to non-centered faces, althought it has not been tested (during testing, we only employ the center crop of the bounding box given by the MTCNN detector) See the paper for more details.

