def calculate_fare(km, vehicle_type, hour):
    rates = {
        'Economy': 10,
        'Premium': 18,
        'Suv': 25
        
    }

    vehicle_type = vehicle_type.capitalize()

    if vehicle_type not in rates:
        return None, None, None, None, "Service Not Available"

    rate = rates[vehicle_type]
    base_fare = km * rate

    # Surge
    surge = 0
    if 17 <= hour <= 20:
        surge = base_fare * 0.5

    # Night charge
    night_charge = 0
    if hour >= 22:
        night_charge = base_fare * 0.2

    # Discount
    discount = 0
    if km > 20:
        discount = base_fare * 0.1

    # Final fare
    final_fare = base_fare + surge + night_charge - discount

    return base_fare, surge, night_charge, discount, final_fare


try:
    km = float(input("Enter distance (in km): "))
    if km<0:
        print("Distance can't be negative")
        exit()
    vehicle_type = input("Enter vehicle type: ")
    hour = int(input("Enter hour (0-23): "))
    if hour<0 or hour>23:
        print("Hour must be between 0 and 23")
        exit()
        

    base, surge, night, discount, final = calculate_fare(km, vehicle_type, hour)

    if base is None:
        print(" Service Not Available")
    else:
        print("\n----- Ride Receipt -----")
        print(f"Distance: {km} km")
        print(f"Vehicle: {vehicle_type.capitalize()}")
        print(f"Base Fare: ₹{base}")
        print(f"Surge Charge: ₹{surge}")
        print(f"Night Charge: ₹{night}")
        print(f"Discount: -₹{discount}")
        print(f"Final Fare: ₹{final}")
      

except ValueError:
    print(" Invalid input!")
