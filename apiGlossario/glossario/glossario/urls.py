from django.contrib import admin
from django.urls import path, include
from core.views import TermoViewSetUnico, TermoViewSetGeral, Busca, ResultadoMultiploView, ResultadoUnicoView
from rest_framework import routers


urlpatterns = [
    path('termo/<term>', TermoViewSetUnico.as_view()),
    path('termos/<term>', TermoViewSetGeral.as_view()),
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls')),
    path('resultados/<term>', ResultadoMultiploView.as_view()),
    path('resultado/<term>', ResultadoUnicoView.as_view()),
    path('busca/', Busca)
]
