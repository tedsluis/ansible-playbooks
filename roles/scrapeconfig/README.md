# Roledonna-scrapeconfig

Deze rol update de scrape configuratie om zo targets toe te voegen of te verwijderen van de Prometheus in DSO-central.
Deze rol wordt aangeroepen door roledonna-nodeexporter en roledonna-nodeexporter-legacy.

Om een node te voorzien van een nodeexporter en om deze ook te laten scrapen roep je een nodeexporter rol aan:

- roledonna-nodeexporter
- roledonna-nodeexporter-legacy

Beide rollen roepen de roledonna-scrapeconfig aan. Er zijn twee manieren om het scrapen te activeren.

1. Voeg de groep waar de node lid van is in de invertory toe aan de defaults van deze rol.
   Voorbeeld:

   ```python

   _otGroups:
      - weblogic_ot
      - oracledb_ot
      - ignite_ot
      - naam_van_een_nieuwe_groep
   ```

   In dit geval worden allenodes in deze groep toegevoegd aan de scrapeconfig

2. Voeg aan de host_var van de node `_want_prometheus_scraping: true` toe.
   Hiermee voeg je een enkele host toe aan de scrape config.

## Aanroepen

Adhoc
`ansible-playbook tests/test.yml -l dsootgluster*`

Vanuit de provisioning wordt de roledonna-nodeexporter(-legacy) ook aangeroepen, hier zijn ook weer meer groepen toe te voegen om de nodeexporter op te installeren. ___Deze groepen bepalen dus niet wat de roledonna-scrapeconfig doet___

```python
  - include_role:
      name: roledonna-nodeexporter
    when: 'group_names|join(" ") is search("weblogic|ignite_ot|lpt05_oracledb|lpt02_oracledb|lpt02_oracledb|ignite_ot") and ansible_distribution_major_version != "6"'
  - include_role:
      name: roledonna-nodeexporter-legacy
    when: 'group_names|join(" ") is search("weblogic|ignite_ot|lpt05_oracledb|lpt02_oracledb|lpt02_oracledb|ignite_ot") and ansible_distribution_major_version == "6"'
```
