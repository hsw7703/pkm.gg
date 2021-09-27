from django.urls import path

from . import views

app_name = 'pokemon'

urlpatterns = [
#    path('test/', views.IndexView.as_view(), name='index'),
#    path('<int:pk>/', views.DetailView.as_view(), name='detail'),
    path('pokemon/', views.pokemonMainAPI),
    path('', views.pokemonMainAPI),
    path('pokemon/<int:pkm_id>/', views.pokemonDetailAPI),
    path('item/', views.ItemMainAPI),
    path('item/<int:id>/', views.ItemDetailAPI),
    path('battle/', views.BattleItemAPI),
    path('news/', views.NewsMainAPI),
    path('build/', views.build),
#    path('news/<int:news_id>/', views.NewsDetailAPI),
]
