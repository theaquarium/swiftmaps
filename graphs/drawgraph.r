library(ggplot2)

options(scipen = 999)

linear <- read.csv("data/linear.csv")
binary <- read.csv("data/binary.csv")
hash <- read.csv("data/hash.csv")

draw_graph <- function(data_set, y_limit, samp_data, exp_formula, draw_top_graph = FALSE) {
  return(
    ggplot(
      data.frame(x = rep(data_set$cycle, 2), y = c(data_set$get, data_set$set), op = rep(c("Get", "Set"), length(data_set$cycle))),
      mapping = aes(x, y, col = op)
    ) +
      geom_point(
        size = 3
      ) +
      coord_cartesian(ylim = y_limit) +
      labs(
        y = expression(paste("Time (", mu, "s)")),
        x = "Number of elements (100s)",
        col = "Operation"
      ) +
      # stat_smooth(
      #   method = "lm",
      #   formula = y ~ log(x),
      #   color = "green",
      #   size = 2,
      #   se = FALSE
      # ) +
      stat_smooth(
        data = samp_data,
        mapping = aes(x, y, col = name),
        method = "lm",
        formula = exp_formula,
        # color = "blue",
        linetype = "dashed",
        size = 2,
        se = FALSE
      ) +
      scale_color_manual(
        values = c("#251351", "#58A4B0", "#D33F49")
      ) +
      guides(color = guide_legend(override.aes = list(size = 12))) +
      theme(
        legend.position = if (draw_top_graph) c(.95, .95) else c(.95, 0.05),
        legend.justification = if (draw_top_graph) c("right", "top") else c("right", "bottom"),
        legend.box.just = "right",
        legend.margin = margin(6, 6, 6, 6),
        text = element_text(size = 20)
      )
  )
}

ggsave(
  "outputs/linear.png",
  plot = draw_graph(
    linear,
    c(1, 350000),
    data.frame(x = c(1, 100), y = c(1, 350000), name = c("Expectation")),
    y ~ x
  )
)

ggsave(
  "outputs/binary.png",
  plot = draw_graph(
    binary,
    c(0, 1000),
    data.frame(x = c(1, 100), y = c(1, 700), name = c("Expectation")),
    y ~ log(x)
  )
)

ggsave(
  "outputs/hash.png",
  plot = draw_graph(
    hash,
    c(0, 400),
    data.frame(x = c(1, 100), y = c(60, 60), name = c("Expectation")),
    y ~ x,
    TRUE
  )
)
