#' Complete list of commonly used color palettes by MI Umbrella
#'
#' Use \code{\link{mipalette}} to construct palettes of desired length.
#'
#' @export
mipalettes <- list(
  MIStartMap = c("#bbdbff","#a0bddc","#8b96c9","#8d6cb0","#8a419e","#6b1568","#4d0a4a"),
  OldMIStartMap = c("#bed4e6","#a0bddc","#8b96c9","#8d6cb0","#8a419e","#6b1568"),
  MISafeStart = c("#971a17","#cb2917","#fd7a24","#fecf41","#176898","#295065"),
  CDCTransmissionLevels = c("#1d8aff","#fff70e","#ff7134","#ff0000"),
  MISMTransmissionLevels = c("#C7E1FF", "#EFDD3A", "#F88D27", "#AD0F00"),
  CDCCommunityLevels = c("#00CC99", "#FFFF99", "#FC8D59"),
  MISMCommunityLevels = c("#A6DAC1", "#F5E146", "#CC7341"),
  MISMTequilaSunrise = c("#a4c2f4","#ffe599","#f6b26b","#e06666","#c27ba0","#741b47"),
  MILighthouse = c("#8e0152", "#C51B7D", "#DE77AE", "#F1B6DA", "#FDE0EF", "#E6F5D0", "#AAD476", "#72AE36", "#438419", "#1E5311", "#9FA09F"),
  MILighthouseSVI = c("#FFFFCC", "#A1DAB4", "#41B6C4", "#225EA8", "#9FA09F"),
  DearEpi = c("#797EF6", "#4ADEDE", "#1AA7EC", "#1E2F97"),
  SoM = c("#277c78", "#256A6C", "#20565D", "#1C4A54", "#19414D", "#173946", "#153142", "#142D3F"),
  # MIUmbrellaBars = c("#3276A3", "#008ec6"), # header bar colors on Lighthouse and Start Map
  USRegionalTrends = c("#e9c46a", "#f4a261", "#e76f51", "#8ac926", "#6a994e", "#0096c7", "#00b4d8", "#48cae4", "#8338ec", "#AD5FF5"),
  UMSecondaryColors = c("#9A3324", "#D86018", "#CFC096", "#A5A508", "#75988D", "#00B2A9", "#2F65A7", "#702082", "#575294", "#989C97", "#9B9A6D", "#655A52", "#131516"),
  RetroRainbow = c("#c1121f", "#f8961e", "#f9c74f", "#90be6d", "#43aa8b", "#577590", "#4b3f72"),
  RetroRainbow2 = c("#710912","#c1121f","#f8961e","#f9c74f","#90be6d","#43aa8b","#577590","#4b3f72","#b196d6"),
  SunForest6 = c("#E76F51", "#F4A261", "#E9C46A", "#AAAA77", "#2A9D8F", "#264653"),
  BeachBall = c("#0077bb","#33bbee","#009988","#f6c141","#ee7733","#cc3311"),
  GreyTealGold = c("#918D8F", "#177E89", "#084C61", "#FFC857"),
  BigTop = c("#006d8f","#00afb9","#fea82f","#bf566d","#652a51"),
  BigTop2 = c("#005f73","#ca6702","#90a959","#863242","#443850"),
  Midsummer = c("#0a210f","#14591d","#99aa38","#e7b34b","#718fb4"),
  SummerHike = c("#fe7f2d","#fcca46","#a1c181","#619b8a","#233d4d")
)

#' MI Umbrella commonly used color palettes
#'
#' These are various color palettes that are used frequently for the MI Umbrella projects. They include color schemes from MI Start Map, MI Lighthouse, and various COVID levels. 
#' This function was borrowed pretty much directly from Kartik Ram's wesanderson package: \url{https://github.com/karthik/wesanderson}
#'
#' @param n Number of colors desired. If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{MIStartMap}, \code{OldMIStartMap},  \code{MISafeStart},
#'   \code{CDCTransmissionLevels}, \code{MISMTransmissionLevels},  \code{CDCCommunityLevels}, \code{MISMCommunityLevels},
#'   \code{MISMTequilaSunrise},  \code{USRegionalTrends} , \code{RetroRainbow} ,
#'   \code{RetroRainbow2}, \code{SunForest6}, \code{BeachBall}, \code{GreyTealGold},
#'   \code{BigTop}, \code{BigTop2}, \code{Midsummer}, \code{SummerHike}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' mipalette("MIStartMap")
#' mipalette("MISMCommunityLevels")
#' mipalette("SunForest6")
#' mipalette("SunForest6", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- mipalette(21, name = "RetroRainbow", type = "continuous")
#' image(volcano, col = pal)
mipalette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- mipalettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}