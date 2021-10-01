from django.urls import path

from . import views

app_name = 'pokemon'

urlpatterns = [
    path('pokemon/', views.pokemonMainAPI),
    path('', views.pokemonMainAPI),
    path('pokemon/<int:pkm_id>/', views.pokemonDetailAPI),
    path('item/', views.ItemMainAPI),
    path('item/<int:id>/', views.ItemDetailAPI),
    path('battle/', views.BattleItemAPI),
    path('news/', views.NewsMainAPI),
#    path('build/', views.build),
#    path('test/', views.pokemonMainTestAPI),
#    path('test_item/', views.buildTest),
#    path('news/<int:news_id>/', views.NewsDetailAPI),

    path('build_test/', views.build_test),
]
