import datetime						# For default dates on models
from sins.models.meta import Base	# We need to import our metadata.

# Right now all of the datatypes will will need for any table is being imported
# every time. Before shipping a public release this should be fixed.
from sqlalchemy import (
	Column,
	Integer,
	Unicode,		# Provides Unicode field
	UnicodeText,	# Text field of unrestricted length
	CHAR,			# Fixed lenth strings
	Boolean,		# Provides true/false values
	DateTime,		# Time abstraction
	ForeignKey,		# This table needs to reference users and topics.
	orm
)
# The date should be human readable.
from webhelpers2.date import distance_of_time_in_words

class Post(Base):
	# Metadata
	__tablename__ = 'posts'
	
	# Keys
	post_id = Column(Integer, primary_key=True)
	
	# Foreign Keys
	topic_id = Column(Integer, ForeignKey('topics.topic_id'), nullable=False)
	user_id = Column(Integer, ForeignKey('people.user_id'), nullable=False)
	
	# Attributes
	posted_date = Column(DateTime, nullable=False)
	message = Column(UnicodeText, nullable=False)
	
	# The date the topic was posted needs to be human readable.
	@property 
	def posted_in_words(self):
		return distance_of_time_in_words(
			self.posted_date,
			datetime.datetime.utcnow()
		)