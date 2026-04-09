minutes = int(input("Enter minutes: "))

hours = minutes // 60
remaining = minutes % 60

if hours == 1:
    hour_text = "1 hr"
else:
    hour_text = f"{hours} hrs"

if remaining == 1:
    min_text = "1 minute"
else:
    min_text = f"{remaining} minutes"

print(hour_text, min_text)