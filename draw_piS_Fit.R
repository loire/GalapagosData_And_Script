require(ggplot2)
require(dplyr)
dat = read.table("popphyl_data_pis_fis.csv",sep=",",header = T)

mytheme =  theme_bw()  +  theme(text = element_text(family = "Times",size = 16),legend.key = element_rect(color='white',fill="white",linetype="blank") )

dat$Taxo_for_fig = factor(dat$Taxo_for_fig, levels=c("Arthropods",  "Echinoderms",   "Vertebrates"  ,"Molluscs"  , "Other"  ))

pdf("piS_Fit.pdf",height = 7, width=10)

sp_list = c("Homo_sapiens","Chelonoidis_nigra","Chelonoidis_nigra+Chelonoidis_carbonaria")
	
p2 = ggplot()
p2 = p2 +  geom_point(data = dat %>% filter(Number_of_Individuals >= 4), alpha = 0.5 ,  aes(shape=status, text = (Species) , color = Taxo_for_fig, x = piS, y = Fit), size = 6 )  + scale_shape_manual(values=c(1,19))  
p2 = p2 +  geom_text(data = dat %>% filter(Species %in% sp_list), aes(label = Species,  x = piS, y=Fit), fontface=3,  size =4, hjust = 0 , vjust = c(-0.3,0.8,-0.2)) 
p2 = p2 + scale_color_brewer(palette = "Set1")  + scale_x_log10() 
p2 = p2 + theme_bw()  +  theme(text = element_text(family = "Times",size = 16))
p2 = p2  + xlab(expression(pi[s])) + ylab(expression(F[IT])) 
p2 = p2 +  annotation_logticks() + expand_limits(x=c(0,0.1),y=c(0,0.7))
p2 = p2 + theme(legend.key=element_blank(), legend.title=element_blank())
p2


dev.off()




