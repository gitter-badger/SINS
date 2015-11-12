<!-- Step one. Include the base. -->
<%inherit file="base.mako"/>

<!-- Step two. Modify the title so that it's specific to the user. -->
<%block name="title">
	${user.username}
</%block>

<!-- Step three. Make the body. -->
<h1>${user.username}</h1>
<% image_path = user.avatar %>
<img src=${image_path} alt=${user.username} />

<!-- Step four. List any current bans that are applied to the user -->
<!-- I will need to decide how to display this information on the page. Until
			then I will just leave it as raw data. I think more than likely it will
			probably end up being displayed in a table
-->
% for ban in user.bans:
		${ban.start_date}
		% if end_date:
				${ban.end_date}
		% endif
		
		<p>
			${ban.reason}
		</p>
% endfor

<!-- Step five. List all of the groups that the user is a member of. -->
<!-- This might take some thinking since a membership is a relational entity.
			However, memberships are backref'd to groups, so it's possible that I will
			be able to get that information directly
-->

<!-- Step six. List the most recent posts by the user. -->
<!-- This will take a little more logic than what is here right now.  -->
<!-- This, much like memberships might be a little more complicated than it
			appears. More than likely it will be fine because of the backref. But I'm
			going to put this off for just right now.
-->
<!-- Posts should link to the topic where they were posted. -->
% for post in user.posts:
		${post.date}
		<a>${post.topic.title}</a>
% endfor