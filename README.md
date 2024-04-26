![photo_2024-04-25_11-46-59](https://github.com/OhoodH/Update-SWIFT.SAT-Propagation-and-Blockchain/assets/159652185/9f37343e-27e6-4d75-9037-52f55b8877fe)
# built with SWIFT core team 
 https://github.com/Aside00/saudi-sweft-sat/blob/main/Oill%20spill%20detection%20.ipynb - use OillSpill Detect 
 https://github.com/saudiswiftsat - use Blockchain technology 
 

# Propagation model 
Path loss propagation is applied in free space, and the free space path loss (FSPL) model is a theoretical tool in communications used to estimate the amount of attenuation (attenuation) of a radio signal as it travels between two antennas. It assumes an ideal environment with a clear line of sight, making it ideal for scenarios such as satellite communications.
The FSPL code was created by using the Matlab application, so that the 
## Pathloss 
is calculated. The best result for it is that it is less than 100,
## Received Signal Strength (RSS)
is calculated. The relationship between it and the PL is direct, so that if the PL weakens, the RSS also weakens, and vice versa, as if the PL increases. RSS increases and this means a weak signal

## Throughput 
 the best when it is reduced and represented by this equation

## Signal to Interference & Noise Ratio (SINR)
 The best ratio when it is between
  5-19 dB

  # BlockChain 
  It is to protect data sent from CubeSats to the ground station, with a special focus on detecting oil spills in the oceans.
We use blockchain technology to store decentralized and tamper-resistant data.
we use also in blockchain :

  ## smart contracts:
 for automated enforcement of rules. A smart contract is a self-executing program stored on the blockchain that automates the actions required in an agreement or contract. Smart contracts allow transactions and trusted agreements to be executed between disparate, anonymous parties without the need for a central authority or legal system. Once completed, transactions are traceable and irreversible.

## IPFS Interplanetary File System,
For decentralized file storage, which is a decentralized peer-to-peer file sharing and storage network, IPFS uses content processing, which is one of its main characteristics, which means that each file on IPFS is uniquely identified by its content. IPFS is also resistant to Especially data loss because files remain available on other nodes even if the node fails.


  ## SHA-256 (Secure Hash Code) 
  for data integrity. It is a hashing algorithm that converts data to a string with a length of 256 bits. Its features are fast, cannot be tampered with, and connect blocks together securely.
Used to create digital signatures
And password hashing
And verify data integrity

# Oil Spill Detection 
We initially adopted YOLOv5  due to its impressive performance and 
efficiency, which allowed us to achieve accurate and real-time object detection. the continuous evolution of YOLO technology underscored its importance as a driving force in 
advancing the capabilities of computer vision systems. We progressed to 
developing our model further and switched to using YOLOv8. This upgrade capitalized on YOLOv5's 
ability to balance accuracy and speed, making it well-suited for real-time applications, but with enhanced 
features that improved our system's performance even more

prediction  YOLO follows these steps to predict bounding boxes and class 
probabilities for objects, in an image:
1. The input image is resized to a fixed size.
2. The network performs forward propagation to generate a prediction map.
3. The prediction map is then decoded to obtain the bounding box positions and class 
probabilities.
4. The system filters the bounding boxes by applying a threshold to the score. Then it applies 
maximum suppression to eliminate any duplicate detections. Only bounding boxes with a 
score than a certain threshold is considered as valid detections. After filtering and applying 
maximum suppression, the remaining bounding boxes represent the final detections .

# Evaluation Indicators To measure the performance of the YOLO algorithm :
• (IOU)
Intersection over Union: IOU measures the overlap between predicted bounding boxes and ground 
truth boxes, with scores ranging from 0 to 1. A higher IOU score indicates a better overlap, and a 
score of 1 indicates a perfect overlap.
IOU = (Area of intersection) / (Area of union) 
Area of intersection is the area of the overlap between the predicted and ground truth bounding 
boxes. Area of union is the area of the union of the predicted and ground truth bounding boxes.
## (AP)
Average Precision (AP): AP measures the precision of object detection at various levels of recall. 
It is computed by calculating the precision and recall values at different IoU thresholds and then 
averaging them. AP is often reported at different IoU thresholds, such as AP@[0.5:0.95], which 
represents the average AP across a range of IoU thresholds.

## (mAP)
Mean Average Precision: mAP is the average of AP values across multiple object classes. It 
provides an overall performance measure for object detection across different categories. 

## (Precision and Recall)
Precision and Recall: Precision is the probability of all predicted positive samples among the actual 
positive samples and is used to measure the prediction accuracy of positive sample results. Recall 
is the probability of actual positive samples being predicted as positive samples, which indicates 
the overall prediction accuracy. Both are calculated as follows:

Where: True Positives (TP), False Positives (FP), True Negatives (TN), and False Negatives (FN)
Precision reflects the ability of the model to discriminate negative samples. The higher the 
precision, the better the model's ability to discriminate negative samples. Recall reflects the 
model's ability to identify positive samples. The higher the recall, the better the ability of the model 
to identify positive samples.

