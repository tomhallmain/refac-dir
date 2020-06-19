

convert "$1" -resize 1x1\! -format "%[pixel:u]\n" info:

# output: rgba(155,51,127,0.266087)

# convert cat.png -resize 1x1\! \
  #  -format "%[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)]" info:-


