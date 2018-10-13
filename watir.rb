require 'watir'
browser = Watir::Browser.new(:firefox)
browser.goto 'google.com'
search_bar = browser.text_field(id: 'lst-ib')
search_bar.set("Ruby")
search_bar.send_keys(:enter)
# collecte tous les titres h3 de classe "LC20lb" dans le resultat de recherche
# attendre que les resultats soient chargés
  browser.driver.manage.timeouts.implicit_wait = 3
  search_result_h3s = browser.h3s(class:"LC20lb")
# puis imprimer les resultats du tableau
search_result_h3s.each { |dv| p dv.text }
# fermer le naviguateur quant c fini
browser.close