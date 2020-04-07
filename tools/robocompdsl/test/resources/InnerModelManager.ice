//******************************************************************
// 
//  Generated by RoboCompDSL
//  
//  File name: InnerModelManager.ice
//  Source: InnerModelManager.idsl
//  
//****************************************************************** 
#ifndef ROBOCOMPINNERMODELMANAGER_ICE
#define ROBOCOMPINNERMODELMANAGER_ICE
module RoboCompInnerModelManager
{
	enum NodeType {  Transform, Joint, DifferentialRobot, OmniRobot, Plane, Camera, RGBD, IMU, Laser, Mesh, PointCloud, TouchSensor, DisplayII  };
	struct AttributeType
	{
		 string type;
		 string value;
	};
	dictionary <string, AttributeType> AttributeMap;
	struct NodeInformation
	{
		 string id;
		 string parentId;
		 NodeType nType;
		 AttributeMap attributes;
	};
	sequence <NodeInformation> NodeInformationSequence;
	enum ErrorType {  NonExistingNode, NonExistingAttribute, NodeAlreadyExists, AttributeAlreadyExists, InvalidPath, InvalidEngine, InvalidValues, OperationInvalidNode, InternalError, Collision };
	exception InnerModelManagerError{
          ErrorType err;
          string text;
        };
	struct Colored3DPoint
	{
		 float x;
		 float y;
		 float z;
		 byte r;
		 byte g;
		 byte b;
	};
	sequence <Colored3DPoint> PointCloudVector;
	struct Plane3D
	{
		 float px;
		 float py;
		 float pz;
		 float nx;
		 float ny;
		 float nz;
		 float width;
		 float height;
		 float thickness;
		 string texture;
	};
	struct coord3D
	{
		 float x;
		 float y;
		 float z;
	};
	struct Pose3D
	{
		 float x;
		 float y;
		 float z;
		 float rx;
		 float ry;
		 float rz;
	};
	struct jointType
	{
		 Pose3D pose;
		 float lx;
		 float ly;
		 float lz;
		 float hx;
		 float hy;
		 float hz;
		 float mass;
		 float min;
		 float max;
		 string axis;
		 int port;
	};
	struct meshType
	{
		 Pose3D pose;
		 float scaleX;
		 float scaleY;
		 float scaleZ;
		 int render;
		 string meshPath;
	};
	sequence <float> FloatSeq;
	struct Matrix
	{
		 int cols;
		 int rows;
		 FloatSeq data;
	};
	interface InnerModelManager
	{
		bool addAttribute (string idNode, string name, string type, string value) throws InnerModelManagerError;
		bool addJoint (string item, string base, jointType j) throws InnerModelManagerError;
		bool addMesh (string item, string base, meshType m) throws InnerModelManagerError;
		bool addPlane (string item, string base, Plane3D plane) throws InnerModelManagerError;
		bool addTransform (string item, string engine, string base, Pose3D pose) throws InnerModelManagerError;
		bool collide (string a, string b);
		void getAllNodeInformation (out NodeInformationSequence nodesInfo) throws InnerModelManagerError;
		bool getAttribute (string idNode, string name, out string type, out string value) throws InnerModelManagerError;
		bool getPose (string base, string item, out Pose3D pose) throws InnerModelManagerError;
		bool getPoseFromParent (string item, out Pose3D pose) throws InnerModelManagerError;
		Matrix getTransformationMatrix (string base, string item) throws InnerModelManagerError;
		bool moveNode (string src, string dst) throws InnerModelManagerError;
		bool removeAttribute (string idNode, string name) throws InnerModelManagerError;
		bool removeNode (string item) throws InnerModelManagerError;
		bool setAttribute (string idNode, string name, string type, string value) throws InnerModelManagerError;
		bool setPlane (string item, Plane3D plane) throws InnerModelManagerError;
		void setPointCloudData (string id, PointCloudVector cloud);
		bool setPose (string base, string item, Pose3D pose) throws InnerModelManagerError;
		bool setPoseFromParent (string item, Pose3D pose) throws InnerModelManagerError;
		bool setScale (string item, float scaleX, float scaleY, float scaleZ) throws InnerModelManagerError;
		bool transform (string base, string item, coord3D coordInItem, out coord3D coordInBase) throws InnerModelManagerError;
	};
};

#endif