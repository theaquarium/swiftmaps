library(ggplot2)

options(scipen = 999)

linear <- read.csv("data/linear.csv")
binary <- read.csv("data/binary.csv")
hash <- read.csv("data/hash.csv")

draw_graph <- function(y_limit, samp_data, exp_formula) {
    return(
        ggplot() +
            coord_cartesian(ylim = y_limit) +
            labs(
                y = "Time",
                x = "Number of elements",
            ) +
            stat_smooth(
                data = samp_data,
                mapping = aes(x, y),
                method = "lm",
                formula = exp_formula,
                color = "#251351",
                linetype = "solid",
                size = 5,
                se = FALSE
            ) +
            theme(
                text = element_text(size = 30),
                axis.text.x = element_blank(),
                axis.text.y = element_blank(),
                axis.ticks = element_blank()
            )
    )
}

ggsave(
    "outputs/o_n.png",
    plot = draw_graph(
        c(1, 350000),
        data.frame(x = c(1, 100), y = c(1, 350000)),
        y ~ x
    )
)

ggsave(
    "outputs/o_logn.png",
    plot = draw_graph(
        c(0, 1000),
        data.frame(x = c(1, 100), y = c(1, 700)),
        y ~ log(x)
    )
)

ggsave(
    "outputs/o_c.png",
    plot = draw_graph(
        c(0, 300),
        data.frame(x = c(1, 100), y = c(100, 100)),
        y ~ x
    )
)
