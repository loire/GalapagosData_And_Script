require(ggplot2)
require(dplyr)
dat = read.table("popphyl_data_pis_fis.csv",sep=",",header = T)


sing  = dat %>% filter(Number_of_Individuals > 3) %>% filter(status == "single")
group  = dat %>% filter(Number_of_Individuals > 3)

mytheme =  theme_bw()  +  theme(text = element_text(family = "Times",size = 16),legend.key = element_rect(color='white',fill="white",linetype="blank") )


pdf("Single_species.pdf",width =15, height = 10)
sing %>% ggplot() + geom_point(aes(x=piS,y=Fit,size = Number_of_Individuals,color=Taxo_for_fig),alpha = 0.7) + scale_color_brewer(guide = guide_legend(override.aes = list(size=6)), name="Taxonomy", palette = "Dark2") + scale_size(range = c(7,12) , name = "Number of individuals") + scale_x_log10() + annotation_logticks() + expand_limits(x=c(0,0.1),y=c(0,0.7)) + xlab(expression(pi[s])) + ylab(expression(F[IT])) + ggtitle("Structure versus diversity in animal species") + mytheme
dev.off()


pdf("Multi_species.pdf",width =15, height = 10)
group %>% ggplot() + geom_point(aes(x=piS,y=Fit,size = Number_of_Individuals,color=status),alpha = 0.5) + scale_color_brewer(guide = guide_legend(override.aes = list(size=6)), name="Type", type = "qual",palette = 6, labels = c("genera","species")) + scale_size(range = c(7,19) , name = "Number of individuals") + scale_x_log10() + annotation_logticks() + expand_limits(x=c(0,0.1),y=c(0,0.7)) + xlab(expression(pi[s])) + ylab(expression(F[IT])) + ggtitle("Structure versus diversity in animal species") + mytheme
dev.off()

