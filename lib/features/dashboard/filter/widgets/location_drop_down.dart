import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class LocationDropdown extends StatefulWidget {
  final Function(String country, String city) onChanged;

  const LocationDropdown({
    super.key,
    required this.onChanged,
  });

  @override
  State<LocationDropdown> createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  String? selectedCountry;
  String? selectedCity;
  bool _isDropdownOpen = false;

  // Dummy/custom data (replace with real data)
  final Map<String, List<String>> countryCityMap = {
    "Pakistan": ["Karachi", "Lahore", "Islamabad"],
    "India": ["Delhi", "Mumbai", "Bangalore"],
    "USA": ["New York", "Los Angeles", "Chicago"],
    // ... aur countries add karo
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TextField-like container
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              const Icon(Icons.location_on, color: Colors.black, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  selectedCountry != null && selectedCity != null
                      ? "$selectedCity , $selectedCountry"
                      : "Select location",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  _isDropdownOpen
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  setState(() {
                    _isDropdownOpen = !_isDropdownOpen;
                  });
                },
              )
            ],
          ),
        ),

        if (_isDropdownOpen)
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView(
              children: countryCityMap.entries.map((entry) {
                final country = entry.key;
                final cities = entry.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(country),
                      onTap: () {
                        setState(() {
                          if (selectedCountry == country) {
                            selectedCountry = null;
                            selectedCity = null;
                          } else {
                            selectedCountry = country;
                            selectedCity = null;
                          }
                        });
                      },
                    ),
                    if (selectedCountry == country)
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: cities.map((city) {
                            return ListTile(
                              title: Text(city),
                              onTap: () {
                                setState(() {
                                  selectedCity = city;
                                  _isDropdownOpen = false;
                                });
                                widget.onChanged(country, city);
                              },
                            );
                          }).toList(),
                        ),
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
