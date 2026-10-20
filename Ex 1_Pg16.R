# 1. Input the data
sections <- c("Chemistry", "Mathematics", "Physics", "Biology", "Geology")
students <- c(1500, 750, 1000, 500, 250)

# ==========================================
# BAR CHART (Base R)
# ==========================================
# Create the bar chart with labels and colors
barplot(students, 
        names.arg = sections, 
        main = "Enrollment by Section", 
        xlab = "Section", 
        ylab = "Number of Students",
        col = "steelblue",
        ylim = c(0, 1700)) # Set y-limit slightly higher to fit labels

# Optional: Add the exact numbers on top of the bars
text(x = barplot(students, plot = FALSE), # Get the x-coordinates of the bars
     y = students, 
     label = students, 
     pos = 3, # Position above the bar
     cex = 0.9, # Font size
     col = "black")


# ==========================================
# PIE CHART (Base R)
# ==========================================
# Calculate percentages for the labels
percentages <- round(students / sum(students) * 100, 1)
labels <- paste(sections, "\n", students, " (", percentages, "%)", sep = "")

# Create the pie chart
pie(students, 
    labels = labels, 
    main = "Distribution of Students by Section",
    col = rainbow(length(sections)), # Generates a nice color palette
    radius = 1.0) # Radius of the pie