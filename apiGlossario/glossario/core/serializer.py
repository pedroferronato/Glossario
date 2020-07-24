from rest_framework import serializers
from .models import Termo

class TermoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Termo
        fields = '__all__'
