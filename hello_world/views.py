from django.shortcuts import render

def hello(request):
    return render(request, 'templates/hello.html', {})