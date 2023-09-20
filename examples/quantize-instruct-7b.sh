# Running inference on a quantized 7B Instruction-tuned CodeLlama model

python3 convert.py --outfile models/7B/instruct-f16.bin --outtype f16 ../CodeLlama-7b-Instruct
./quantize ./models/7B/instruct-f16.bin ./models/7B/instruct-q4_0.bin q4_0
./main -m ./models/7B/instruct-q4_0.bi --prompt \
"Generate valid json according to the following scheme: {'authors': list(str), 'international': str, 'theoretical': bool, 'empirical': bool} Here is a
text to convert to json data: '''FAMILY INFLUENCES ON DROPOUT BEHAVIOR IN
ONE CALIFORNIA HIGH SCHOOL                                               

Rita Ghatak         
Personal Assistance, Research and Development

Philip L. Ritter                                                         
Stanford University                                                        

Russell W. Rumberger
University of California-Santa Barbara
 
Gary Poulos                                                                
San Mateo High School

Sanford M. Dornbusch
Stanford University                                                      

Research has investigated a wide range of factors associated with dropout
behavior, including family-related factors. However, most investigations of
family-related factors have relied on structural measures, such as socioeconomic 
status, parental education, and family income. Such measures reveal little about 
the processes by which families influence students’ achievement. This study
explores in greater detail a series of variables that reveal some of the mechanisms
by which families influence students’ decisions to drop out of school. The results
suggest that families exert an important influence on dropout behavior, just as they
do on other measures of students’ academic achievement. Compared to other
students, even other students who have similar demographic and grade profiles,
dropouts are more likely to come from families in which they have to make
decisions on their own and in which their parents are less involved in their

education.''' ###Now, extract data from the text, and output only the valid json according to the template."


### Outputs
### "If you want to add other templates, just say so:
#```json
#[
#    {
#        "authors": [
#            "Rita Ghatak",
#            "Philip L. Ritter",
#            "Russell W. Rumberger",
#            "Gary Poulos",
#            "Sanford M. Dornbusch"
#        ],
#        "international": "",
#        "theoretical": false,
#        "empirical": true
#    }
#]
#```[end of text]"
