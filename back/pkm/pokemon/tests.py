from django.test import TestCase
from django.urls import reverse
from .models import Pokemon

# Create your tests here.

class Api_url_접속_tests(TestCase):
    def test_포켓몬_메인_페이지_접속(self):
        response = self.client.get(reverse('pokemon:pokemon_main'))
        self.assertEqual(response.status_code, 200)

#    def test_포켓몬_상세_페이지_접속(self):
#        pokemon = Pokemon.objects.create(name_text="a", name="a", img="a", detail_img="a", attack_type_text="a", attack_type='a', type_text='a', type='a', damage_type_text='a', damage_type='a', difficulty_text='a', difficulty='a', passive_name_text='a', passive_name='a', passive_img='a', passive_effect='a', attack_effect='a', offense=1, endurance=1, mobility=1, scoring=1, support=1)
#        print('*' * 80)
#        print(pokemon)
#        response = self.client.get(reverse('pokemon:pokemon_detail', kwargs={'pkm_id':pokemon.id}))
#        self.assertEqual(response.status_code, 200)
#
#    def test_아이템_메인_페이지_접속(self):
#        response = self.client.get(reverse('pokemon:held-items_main'))
#        self.assertEqual(response.status_code, 200)
#
#    def test_아이템_상세_페이지_접속(self):
#        response = self.client.get(reverse('pokemon:pokemon_detail'))
#        self.assertEqual(response.status_code, 200)
#
#    def test_포켓몬_메인_페이지_접속(self):
#        response = self.client.get(reverse('pokemon:pokemon_main'))
#        self.assertEqual(response.status_code, 200)
#
#    def test_포켓몬_상세_페이지_접속(self):
#        response = self.client.get(reverse('pokemon:pokemon_detail'))
#        self.assertEqual(response.status_code, 200)
#

