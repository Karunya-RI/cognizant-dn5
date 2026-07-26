from django.db import models

class Student(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    enrolled_on = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name
