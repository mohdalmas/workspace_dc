
template ="""
        - username: {}
          groups:
              - 6d
    """

users = ["Srinidhi.Srinivasrao","arun.kumar","jami.lahari","sobhan.mohapatra","unni.mohan","sayed.nawaz","sanjay.nair"," viajula","Anjali.Mathew","Vinaya.Hugar","Priyanka.Rebello","Amal.Chand","Ansu.Yohannan","Dheeraj.A","Ritesh.Goenka","Rajan.Kumar","rohan.ch","Mohammed.Arif","Pragati.Nayak","Vijay.Medisetty","Jashwanth.S","Arun.Vinoth","Sashi.Kumar","Shrikant.Ganapati","ajith.selvan","AnjaliS.Pradeep","Niranjan.Ramesh","Muhammed.Isham","Sebastian.Jose","Yashaswini.Basavaraj","Sangeeth.Mohan","Ann Minnu.Sam","Pranav.M R","Prashanthkumar.","Manulal.Balagopalan","vishnu.Raveendran","Muhammed .Adnan","Safaricomet\adharsh.Sunil","angel.Kunj varghese","Sashi.Kumar","Arnold .Dixen ","Manik.p","Debdyut .Sarker","Srinivas .Chikoti","Surya.M","Anila.P","Yugandar.Rajendran","Rajan .Kumar","Mohammed .Arif","arun .kumar","Pragati .Nayak","Vijay .Medisetty","RammezK.Rasack","Sruthy .Thomas","Shyam .Mohan","Navin .Mahato","Umme .Hani","Vishal .Sharma","Anjali S .Pradeep","Deepak.R","Niranjan .Ramesh","chandra.shekar"]


for user in users:
    print(template.format(user))