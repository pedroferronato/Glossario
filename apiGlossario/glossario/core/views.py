from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.response import Response
from .models import Termo
from .serializer import TermoSerializer
from rest_framework.views import APIView
from rest_framework.renderers import TemplateHTMLRenderer

class TermoViewSetUnico(APIView):
    def post(self, request, term):
        query = Termo.objects.get(termo = term)
        return Response(TermoSerializer(instance=query).data)


class TermoViewSetGeral(APIView):
    def post(self, request, term):
        query = Termo.objects.filter(termo__icontains = term)
        return Response(TermoSerializer(instance=query, many=True).data)

def Busca(request):
    return render(request, 'Busca.html')

class ResultadoMultiploView(APIView):
    renderer_classes = [TemplateHTMLRenderer]
    template_name = 'resultado.html'
    
    def get(self, request, term):
        query = Termo.objects.filter(termo__icontains = term)
        try:
            query[0]
        except IndexError:
            return render(request, 'notFound.html')
        serializado = TermoSerializer(instance=query, many=True).data
        return Response({'termos' : serializado})

class ResultadoUnicoView(APIView):
    renderer_classes = [TemplateHTMLRenderer]
    template_name = 'resultadoUnico.html'

    def get(self, request, term):
        try:
            query = Termo.objects.get(termo = term)
        except Termo.DoesNotExist:
            return render(request, 'notFound.html')
            
        serializado = TermoSerializer(instance=query).data
        return Response(serializado)
        