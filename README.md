mipalettes
================

## mipalettes

Mipalettes is an R package for color palettes related to MI Umbrella and
other pandemic response projects. They include color schemes from MI
Start Map, MI Lighthouse, and various COVID levels. It was mostly meant
as a self tutorial on how to make a package (following Hilary Parker’s
[excellent super-simple
intro](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/))
and is largely just a riff on Kartik Ram’s [wesanderson color palettes
package](https://github.com/karthik/wesanderson/tree/master).

## Installation

Install from GitHub using devtools:

``` r
devtools::install_github("epimath/mipalettes")
```

## Example plots

``` r
library("mipalettes")
library("ggplot2")

ggplot(mtcars, aes(factor(cyl), fill=factor(carb))) +  geom_bar() +
  scale_fill_manual(values = mipalette("MIStartMap"))
```

![](README_files/figure-gfm/plots-1.png)<!-- -->

``` r
ggplot(Indometh, aes(x = time, y = conc, color = Subject)) + geom_line(size = 1) + 
  scale_color_manual(values = mipalette("MISafeStart"))
```

![](README_files/figure-gfm/plots-2.png)<!-- -->

``` r
ggplot(mtcars, aes(factor(cyl), fill=factor(gear))) +  geom_bar() +
  scale_fill_manual(values = mipalette("CDCCommunityLevels"))
```

![](README_files/figure-gfm/plots-3.png)<!-- -->

``` r
ggplot(Theoph, aes(x = Time, y = conc, color = Subject)) + geom_line(size = 1) + 
  scale_color_manual(values = mipalette("SunForest6", n = length(unique(Theoph$Subject)), type = "continuous"))
```

![](README_files/figure-gfm/plots-4.png)<!-- -->

``` r
ggplot(faithfuld, aes(waiting, eruptions, z = density)) + geom_contour_filled() + 
  scale_fill_manual(values = mipalette("MILighthouse", n = 9, type = "continuous"))
```

![](README_files/figure-gfm/plots-5.png)<!-- -->

## All palettes

``` r
# All palettes
names(mipalettes)
```

    ##  [1] "MIStartMap"             "OldMIStartMap"          "MISafeStart"           
    ##  [4] "CDCTransmissionLevels"  "MISMTransmissionLevels" "CDCCommunityLevels"    
    ##  [7] "MISMCommunityLevels"    "MISMTequilaSunrise"     "MILighthouse"          
    ## [10] "MILighthouseSVI"        "DearEpi"                "SoM"                   
    ## [13] "USRegionalTrends"       "UMSecondaryColors"      "RetroRainbow"          
    ## [16] "RetroRainbow2"          "SunForest6"             "BeachBall"             
    ## [19] "GreyTealGold"           "BigTop"                 "BigTop2"               
    ## [22] "Midsummer"              "SummerHike"

#### MI Safe Start and MI Start Map Palettes

``` r
mipalette("MIStartMap")
```

![](README_files/figure-gfm/palettes2-1.png)<!-- -->

``` r
mipalette("OldMIStartMap")
```

![](README_files/figure-gfm/palettes2-2.png)<!-- -->

``` r
mipalette("MISafeStart")
```

![](README_files/figure-gfm/palettes2-3.png)<!-- -->

``` r
mipalette("MISMTransmissionLevels")
```

![](README_files/figure-gfm/palettes2-4.png)<!-- -->

``` r
mipalette("MISMCommunityLevels")
```

![](README_files/figure-gfm/palettes2-5.png)<!-- -->

``` r
mipalette("MISMTequilaSunrise")
```

![](README_files/figure-gfm/palettes2-6.png)<!-- -->

#### MI Lighthouse

``` r
mipalette("MILighthouse")
```

![](README_files/figure-gfm/palettes3-1.png)<!-- -->

``` r
mipalette("MILighthouseSVI")
```

![](README_files/figure-gfm/palettes3-2.png)<!-- -->

#### Dear Epi

``` r
mipalette("DearEpi")
```

![](README_files/figure-gfm/palettes4-1.png)<!-- -->

#### UM, State, and CDC

``` r
mipalette("CDCTransmissionLevels")
```

![](README_files/figure-gfm/palettes5-1.png)<!-- -->

``` r
mipalette("CDCCommunityLevels")
```

![](README_files/figure-gfm/palettes5-2.png)<!-- -->

``` r
mipalette("SoM")
```

![](README_files/figure-gfm/palettes5-3.png)<!-- -->

``` r
mipalette("USRegionalTrends") # makes US HHS regions break into West coast/East coast/etc by color group (reorderd here to look nicer though)
```

![](README_files/figure-gfm/palettes5-4.png)<!-- -->

``` r
mipalette("UMSecondaryColors")
```

![](README_files/figure-gfm/palettes5-5.png)<!-- -->

#### Miscellaneous

``` r
mipalette("RetroRainbow")
```

![](README_files/figure-gfm/palettes6-1.png)<!-- -->

``` r
mipalette("RetroRainbow2")
```

![](README_files/figure-gfm/palettes6-2.png)<!-- -->

``` r
mipalette("SunForest6")
```

![](README_files/figure-gfm/palettes6-3.png)<!-- -->

``` r
mipalette("BeachBall")
```

![](README_files/figure-gfm/palettes6-4.png)<!-- -->

``` r
mipalette("GreyTealGold")
```

![](README_files/figure-gfm/palettes6-5.png)<!-- -->

``` r
mipalette("BigTop")
```

![](README_files/figure-gfm/palettes6-6.png)<!-- -->

``` r
mipalette("BigTop2")
```

![](README_files/figure-gfm/palettes6-7.png)<!-- -->

``` r
mipalette("Midsummer")
```

![](README_files/figure-gfm/palettes6-8.png)<!-- -->

``` r
mipalette("SummerHike")
```

![](README_files/figure-gfm/palettes6-9.png)<!-- -->
