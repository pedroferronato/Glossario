from django.db import models

class Termo(models.Model):
    id = models.AutoField(primary_key=True)
    termo = models.CharField(max_length=150)
    area = models.CharField(max_length=75)
    expressao = models.CharField(max_length=150)
    definicao = models.TextField()
    urlImg = models.CharField(max_length=255)

    def __str__(self):
        return self.expressao

