#!/usr/bin/env python
# coding: utf-8

# In[2]:


import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
get_ipython().run_line_magic('matplotlib', 'inline')


# In[3]:


tips_df=sns.load_dataset('tips')


# In[4]:


tips_df


# In[21]:


sns.scatterplot(x='tip',y='total_bill',data=tips_df,hue='sex',s=100)
sns.set_style('darkgrid')
plt.title('accounting of bill and tips')


# In[ ]:


# linegraph


# In[10]:


years = range(2000, 2012)
apples = [0.895, 0.91, 0.919, 0.926, 0.929, 0.931, 0.934, 0.936, 0.937, 0.9375, 0.9372, 0.939]
oranges = [0.962, 0.941, 0.930, 0.923, 0.918, 0.908, 0.907, 0.904, 0.901, 0.898, 0.9, 0.896, ]


# In[37]:


plt.plot(years,apples,'s--g')
plt.plot(years,oranges,'o-r')
plt.xlabel('years')
plt.ylabel('yields')
sns.set_style('darkgrid')
plt.legend(['apples','oranges'])


# In[ ]:


#scatterplot


# In[12]:


flowers_df=sns.load_dataset('iris')


# In[13]:


flowers_df


# In[19]:


sns.scatterplot(x='sepal_length',y='sepal_width',data=flowers_df,hue='species',s=150);
sns.set_style('darkgrid')


# In[ ]:


#histogams


# In[22]:


plt.hist()


# In[23]:


setosa_df=flowers_df[flowers_df.species=='setosa']


# In[24]:


versicolor_df=flowers_df[flowers_df.species=='versicolor']


# In[25]:


virginica_df=flowers_df[flowers_df.species=='virginica']


# In[38]:


plt.hist([setosa_df.sepal_width,versicolor_df.sepal_width,virginica_df.sepal_width],bins=np.arange(2,5,0.25),stacked=True)
sns.set_style('darkgrid')
plt.legend(['setosa','versicolor','virginica'])


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




