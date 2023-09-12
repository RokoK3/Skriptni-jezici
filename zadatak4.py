import urllib.request
import re
from urllib.parse import urlparse
import sys

def get_webpage_content(url):
    page = urllib.request.urlopen(url)
    content = page.read().decode("utf8")
    return content

def get_all_links(content):
    return re.findall('href="(.*?)"', content) #Pronadi ono sto krece sa href=" pa onda ide bilo sto i zavrsava s "

def get_unique_hosts(links):
    hosts = [urlparse(link).netloc for link in links] # netloc izvlači hosta iz linka
    return list(set(hosts)) # makni duplikate sa setom i vrati listu

def get_references_counts(links):
    hosts = [urlparse(link).netloc for link in links] # netloc izvlači hosta iz linka
    return {host:hosts.count(host) for host in hosts} #vrati dict kojem je key host, a value count

def get_emails(content):
    return re.findall(r'[\w\.-]+@[\w\.-]+', content) #Pronadi bilo koji character tocku ili - jednom ili vise, zatim ide @ zatim ide bilo koji character tocka ili -

def count_image_links(content):
    return len(re.findall('<img src="(.*?)"', content)) #Pronadi ono sto krece sa <img src=" pa onda ide bilo sto i zavrsava s "

url = sys.argv[1]
content = get_webpage_content(url)

print("\nSadržaj web stranice:\n", content)

links = get_all_links(content)
print("\nSvi linkovi na stranici:\n", links)

unique_hosts = get_unique_hosts(links)
print("\nJedinstveni hostovi:\n", unique_hosts)

references_counts = get_references_counts(links)
print("\nBroj referenciranja za svaki host:\n", references_counts)

emails = get_emails(content)
print("\nSve email adrese na stranici:\n", emails)

image_links_count = count_image_links(content)
print("\nBroj linkova na slike:\n", image_links_count)